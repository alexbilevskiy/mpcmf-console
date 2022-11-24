<?php
{assign var="data" value=$entityData['struct'][$entityKey]}

namespace {$entityData['moduleNamespace']}\mappers;

use mpcmf\modules\moduleBase\mappers\mapperBase;
use mpcmf\system\pattern\singleton;
use {$entityData['moduleNamespace']}\models\{$entityData['name']}Model;

/**
 * Class {$data['className']}
 *
{if !empty($entityData['description'])}
 * {$entityData['description']|replace:"\n":"\n * "}
 *
{/if}
{include file="generator.tpl"}
 *
 * @package {$entityData['moduleNamespace']}\mappers
 *
{foreach from=$entityData['authors'] item='author'}
 * @author {$author['name']} <{$author['email']}>
{/foreach}
 *
 * @method static self getInstance
 * @method {$entityData['name']}Model getBy($criteria, $fields = [])
 * @method {$entityData['name']}Model getById($id)
 * @method []{$entityData['name']}Model getAllBy($criteria = [], array $fields = [], array $sort = null) note: returns cursor, nor array
 */
class {$data['className']}
    extends mapperBase
{

    use singleton;

{foreach from=$data['map'] key="fieldName" item="fieldData"}
    const FIELD__{$fieldName|mb_strtoupper} = '{$fieldName}';
{/foreach}

    public function getPublicName()
    {
        return '{if empty($data['publicName'])}{$entityData['name']}{else}{$data['publicName']}{/if}';
    }

    /**
     * Entity map
     *
     * @return array[]
     */
    public function getMap()
    {
        return [
{foreach from=$data['map'] key="fieldName" item="fieldData"}
            self::FIELD__{$fieldName|mb_strtoupper} => [
                'getter' => 'get{$fieldData['mixedCase']|ucfirst}',
                'setter' => 'set{$fieldData['mixedCase']|ucfirst}',
                'role' => {$fieldData['roles']|var_export:true|replace:"\n":"\n                "},
                'name' => '{$fieldData['name']|replace:"'":"\\'"}',
                'description' => '{$fieldData['description']|replace:"'":"\\'"}',
                'type' => '{$fieldData['type']|replace:"'":"\\'"}',
                'formType' => '{$fieldData['formType']|replace:"'":"\\'"}',
                'validator' => {$fieldData['validator']|var_export:true|replace:"\n":"\n                "},
                'relations' => {$fieldData['relations']|var_export:true|replace:"\n":"\n                "},
                'options' => {$fieldData['options']|var_export:true|replace:"\n":"\n                "},
            ],
{/foreach}
        ];
    }
}